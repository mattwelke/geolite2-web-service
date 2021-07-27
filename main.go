package main

import (
	"encoding/json"
	"errors"
	"io/ioutil"
	"log"
	"net"
	"net/http"

	"github.com/oschwald/geoip2-golang"
)

func main() {
	db, err := geoip2.Open("db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	http.HandleFunc("/geo", func(w http.ResponseWriter, r *http.Request) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			log.Fatal(err)
		}
		if len(body) < 1 {
			log.Fatal(errors.New("request body too short to have IP"))
		}

		ip := net.ParseIP(string(body))

		record, err := db.City(ip)
		if err != nil {
			log.Fatal(err)
		}

		recordJSON, err := json.Marshal(record)
		if err != nil {
			log.Fatal(err)
		}

		w.Write(recordJSON)
	})

	http.ListenAndServe(":8080", nil)
}
