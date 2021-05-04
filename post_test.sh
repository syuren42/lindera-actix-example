#!/bin/bash


sentence="恥の多い生涯を送って来ました。自分には、人間の生活というものが、見当つかないのです。自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。"


curl -X POST -H "Content-Type: application/json" -d "{\"sentense\":\"${sentence}\"}" localhost:8080/api/v1/tokenize

