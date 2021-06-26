use lindera::tokenizer::Tokenizer;
use lindera_core::core::viterbi::Mode;
use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
struct InputSentense {
    sentense: String,
}

#[derive(Debug, Serialize, Deserialize)]
struct ResponseTokens {
    token: String,
}

#[get("/health")]
async fn health() -> impl Responder {
    HttpResponse::Ok().body("response ok!")
}

#[post("/api/v1/tokenize")]
async fn echo(input: web::Json<InputSentense>) -> impl Responder {

    let mut tokenizer = Tokenizer::new(Mode::Normal, "/usr/local/lib/lindera/lindera-ipadic-2.7.0-20070801-neologd-20200910");
    //let mut  tokenizer = Tokenizer::new(Mode::Normal,"");
    let tokens = tokenizer.tokenize(&input.sentense);
    let mut results_tokens = "".to_string() ;
    for token in tokens {
        println!("{}", token.detail[0]);

        if token.detail[0].eq("名詞"){
            results_tokens.push_str(token.text);
            results_tokens.push_str(",");
        }
    }

    HttpResponse::Ok()
    .content_type("application/json")
    .json(ResponseTokens{
        token: results_tokens.to_string()
    })

}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(health)
            .service(echo)
    })
    .bind("0.0.0.0:8080")?
    .workers(1024) 
    .run()
    .await
}
