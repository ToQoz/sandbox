(ns convert-map-to-query-string.core-test
  (:require [clojure.test :refer :all]
            [convert-map-to-query-string.core :refer :all]))

(deftest url-encode-test
         (testing "Test fn URL encode"
                  (is (= "+%2C" (url-encode " ,")))))

(deftest convert-map-to-query-string-test
         (testing "Test fn Convert map to query string"
                  (is (=
                        "a=a+with+space&b=b&c=c&d=d&e=e%2Ce&f=true"
                        (convert-map-to-query-string (sorted-map :a "a with space", :b "b", :c "c", :d "d", :e "e,e", :f true))))))
