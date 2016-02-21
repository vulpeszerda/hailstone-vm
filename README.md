# hailstone-vm

## /script
VM 관련 셸스크립트 모음

* vbox-init.sh
  VirtualBox 설치 (최초 1회, Ubuntu용)

* createvm.sh <VM 이름> <포트 번호>
  VM 생성

* deletevm.sh <VM 이름>
  VM 삭제

* showvm.sh <VM 이름>
  VM 정보

* startvm.sh <VM 이름>
  VRDP 서버 시작

* stopvm.sh <VM 이름>
  VRDP 서버 종료


## /tls
self-sign된 TLS 인증서, 프라이빗 키까지 포함돼있어서 매우 위험하므로 나중에 삭제해야함

## /vdi
virtualbox 하드디스크 이미지가 저장되는 경로
기본적으로 이미지가 포함되어 있지 않으므로 http://sourceforge.net/projects/osboxes/files/vms/vbox/android-x86/5.1/Android-x86_5.1-RC1.7z/download 에서 다운로드 받은 후 압축을 풀어서 /vdi/Android-x86 5.1 rc1.vdi에 저장해줘야 함. 혹은, /script/createvm.sh 파일의 VDI_ORIGIN 경로를 수정해줘도 됨.
createvm.sh 스크립트를 수행하면 /vdi/에 'Android-x86 5.1 rc1.vdi'가 복제돼서 저장됨.
