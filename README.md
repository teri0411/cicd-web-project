# cicd-web-project
![1](https://user-images.githubusercontent.com/75375944/209966899-564c92df-bde3-4e3f-b0be-43c910ebd687.png)
### Jenkins를 이용한 CI/CD 자동화 도구의 사용
1. Jenkins에서 war파일을 Ssh를 이용해서 서버2에 복사
2. 서버2에서 Dockerfile + *war -> Docker image 빌드
3. Docker image를 기반으로 컨테이너 생성(Docker 내부에 컨테이너 생성= Docker in Docker 방식)

### Jenkins + Infrastructure as Code 와의 연동
- Ansible 명령어, 설정과 작동 과정 이해
- Ansible Playbook 학습
- Jenkins + ansible 연동
- Ansible을 이용한 Docker Image 관리 및 컨테이너 생성

![2](https://user-images.githubusercontent.com/75375944/209966902-b092e3e0-5470-48c0-952f-65427087fbd1.png)
### Jenkins + Ansible + Kubernetes 와의 연동
- Kubernetes Script 파일 학습
- Kubernetes + Ansible 연동
- Ansible을 이용한 kubenetes 제어
- playbook 이용 kubernetes Script 실행
### Jenkins Pipeline
- Jenkins Pipeline 스크립트 사용 및 생성
- Pipeline Syntax 사용
- tomcat 및 도커 컨테이너에 배포
### Jenkins - SonarQube, Multi nodes 구성
- Jenkins + SonarQube 연동 및 bad code 조사
- SonarQube사용을 위한 Pipeline 활용
- Master + Slaves 멀티노드 구성

![3](https://user-images.githubusercontent.com/75375944/209966905-e0664db4-6734-4807-aec0-1e1ac0da1e7f.png)
### 퍼블릭 클라우드 환경에 배포
- Ec2에 jenkins, Docker, Tomcat, Ansible, SonarQube 설치
- Jenkins활용 Tomcat, Docker Ansible 서버에 배포



