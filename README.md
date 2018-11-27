# English

## RCI Solution API Dockerfile
- API description is in rci\_solution\_api
- Download via Docker hub is also possible
- Returns the probability of customers' buying insurance and customers' rank


## Installation
```sh
docker pull lsjhome/rci_rest_api:1.0
```


## Run
```sh
docker run -it -d -p <hostport>:8080 --name <name> lsjhome/rci_rest_api:1.0
```


## Example
- post
http://localhost:<hostport>/predict?age=40&gender=여&contract_month=6&credit_check=거절&credit=7~9&postcode=06&car_price=25730000&principal=20000000&n_div=10
- Return
{
    "predict_proba": 0.1968,
    "rank": 2
}

# 한글

## RCI 솔루션 API 도커파일
- API 사용법은 rci\_solution\_api 폴더 내부에 존재
- Docker hub을 통해서도 다운로드 가능
- RCI 고객들이 보험상품에 가입할 확률, 등급을 나타내 주는 API
 

## 설치
```sh
docker pull lsjhome/rci_rest_api:1.0
```


## 실행
```sh
docker run -it -d -p <hostport>:8080 --name <name> lsjhome/rci_rest_api:1.0
```


## 결과 확인
- post로 요청
http://localhost:<hostport>/predict?age=40&gender=여&contract_month=6&credit_check=거절&credit=7~9&postcode=06&car_price=25730000&principal=20000000&n_div=10
- 결과값
{
    "predict_proba": 0.1968,
    "rank": 2
}
