(ns convert-map-to-query-string.core)

(import [java.net URLEncoder])
(use '[clojure.string :only [join]])

(defn url-encode [s] (URLEncoder/encode (str s) "UTF-8"))
(defn convert-map-to-query-string [m] (join \& (into []  (for [[k v] m] (join \= [(url-encode (name k)) (url-encode v)])))))
