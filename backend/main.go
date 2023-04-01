package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	_ "github.com/lib/pq"
	"io/ioutil"
	"log"
	"net/http"
	"os"
)

func connect() (*sql.DB, error) {
	bin, err := ioutil.ReadFile("/run/secrets/db-password")
	if err != nil {
		return nil, err
	}
	return sql.Open("postgres", fmt.Sprintf("postgres://postgres:%s@db:5432/example?sslmode=disable", string(bin)))
}

func blogHandler(w http.ResponseWriter, r *http.Request) {
	db, err := connect()
	if err != nil {
		w.WriteHeader(500)
		return
	}
	defer db.Close()

	rows, err := db.Query("SELECT text FROM message")
	if err != nil {
		w.WriteHeader(500)
		return
	}
	var titles []string
	for rows.Next() {
		var text string
		err = rows.Scan(&text)
		titles = append(titles, text)
	}
	json.NewEncoder(w).Encode(titles)
}

func main() {

	log.Print("Listening 8000")
	r := mux.NewRouter()
	r.HandleFunc("/", blogHandler)
	log.Fatal(http.ListenAndServe(":8000", handlers.LoggingHandler(os.Stdout, r)))
}
