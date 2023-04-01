package main

import (
	"fmt"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"os"
)

func main() {
	log.Print("Start api ...")

	r := mux.NewRouter()
	r.HandleFunc("/message", MessagesHandler)
	http.Handle("/", r)

	log.Fatal(http.ListenAndServe(":8000", handlers.LoggingHandler(os.Stdout, r)))
}

func MessagesHandler(w http.ResponseWriter, r *http.Request) {

	err := r.ParseForm()
	if err != nil {
		return
	}
	vars := r.Form

	if vars["user_id"] == nil || vars["channel_id"] == nil || vars["text"] == nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "user_id: %v\n", vars["user_id"])
	fmt.Fprintf(w, "channel_id: %v\n", vars["channel_id"])
	fmt.Fprintf(w, "text: %v\n", vars["text"])

}
