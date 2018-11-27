# English
# Installation

## Python 3.6.4

Install Python 3.6.4 via Pyenv, Anaconda, or Python Foundation

## Install Packages
- pip3 install -r requirements.txt

## Files and Folder Description
- preprocess: Folder for preprocessing files
	- \_\_init\_\_.py: required to make Python treat the directories as containing packages
	- catboost.pkl: Python Pickle file that contains ML model
	- feature\_prepro.py: Contains functions for data preprocessing
	- make\_rank.py: Transform ML probability to Rank
	- pc\_score.pkl: contains information for transforming customers' postcode to continous value that has 100 as max
	- prob\_list.pkl: contains information for transforming probabilities to ranks
	- scoring.py: Making Categorical variable continous variable
	- rci\_rest\_api.py: **REST API Server**
	- rci\_solution\_api\_demo_.py: solution demo file that predict customers' probability to buy insurance and their rank based on input
		- python rci\__solution\_api\_demo.py -h has help function
- requirements.txt: Python packages for the solution installation
- RCI\_REST\_API.docx: REST API description file

## Usage

- Solution file
```sh
$ python rci_restful_api.py &
[1] 84591
$ * Serving Flask app "rci_restful_api" (lazy loading)
  * Environment: production
    WARNING: Do not use the development server in a production environment.
    Use a production WSGI server instead.
    * Debug mode: off
    * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```

- Solution Demo file
```sh
$ python rci_solution_api_demo.py --age 20 --gender '남' --contract_month 12 --credit_check '조건부' --credit '7~9' --postcode '07' --car_price 20000000 --principal 19000000 --n_div 5
가입확률: 0.1317, 고객등급: 2
```

## Parameters

- age: age, int type
- gender: gender, str type
- contract\_month: month when the contract made, int type
- credit\_check: credit check, str type
- credit: credit, str type
- postcode: postcode, str type
- car\_price: car price, int type
- principal: principal, int type
- n\_div: the number of total ranks, int type





# 한글
# 설치법

## Python 3.6.4 설치

Pyenv, Anaconda, Python 공식 홈페이지 등을 통해 3.6.4 버전을 설치

## 필요 라이브러리들 설치
- pip3 install -r requirements.txt

## 파일, 폴더 설명
- preprocess: 전처리를 위한 파일들이 있는 폴더
	- \_\_init\_\_.py: 패키지 인식을 위한 파일
	- catboost.pkl: 머신러닝 모델 객체가 저장된 파이썬 pickle 파일
	- feature\_prepro.py: 데이터 전처리를 위한 여러가지 함수들이 저장된 파일
	- make\_rank.py: 머신러닝 모델에 의해 점수가 만들어진 후, 이 점수를 등급으로 나누기 위한 파일
	- pc\_score.pkl: 고객의 우편번호 정보를 100점 만점의 연속형 변수로 만들기 위한 객체가 저장된 파이썬 pickle 파일
	- prob\_list.pkl: 모델의 점수를 등급별로 만들기 위한 기준값이 저장된 객체가 저장된 피클파일
	- scoring.py: 카테고리 변수를 연속형 변수로 변환시키기 위한 파일
	- rci\_rest\_api.py: **REST API 서버를 실행시키기 위한 파일**
	- rci\_solution\_api\_demo_.py: input 값들에 기반한 고객의 가입확률과 고객등급을 출력해주는 솔루션 데모 파일
		- python rci\__solution\_api\_demo.py -h 을 통해서 도움말 보기 가능
- requirements.txt: 솔루션 설치에 필요한 파이썬 패키지 리스트
- RCI\_REST\_API.docx: REST API 명세서 파일

## 사용 예시

- 솔루션 파일
```sh
$ python rci_restful_api.py &
[1] 84591
$ * Serving Flask app "rci_restful_api" (lazy loading)
  * Environment: production
    WARNING: Do not use the development server in a production environment.
    Use a production WSGI server instead.
    * Debug mode: off
    * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```

- 솔루션 데모 파일
```sh
$ python rci_solution_api_demo.py --age 20 --gender '남' --contract_month 12 --credit_check '조건부' --credit '7~9' --postcode '07' --car_price 20000000 --principal 19000000 --n_div 5
가입확률: 0.1317, 고객등급: 2
```

## 인자 값 설명

- age: 연령, int type
- gender: 성별, str type
- contract\_month: 할부계약 체결월, int type
- credit\_check: 신용한도조회, str type
- credit: 신용등급, str type
- postcode: 고객 우편번호, str type
- car\_price: 차량가격, int type
- principal: 할부원금, int type
- n\_div: 고객등급 나누는 기준, int type
