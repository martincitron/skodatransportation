rem docker login --username martincitron
rem 2c082851-2929-401e-8324-2f24e0419f93

rem oc new-app martincitron/acebuild~git@github.com:martincitron/HW.git#dev --strategy=source -l name=dev --name=dev --source-secret=github
oc new-app vernemq/vernemq -l name=vernemq1 --name=vernemq1 --env-file envs1.txt

oc create route edge lbmqtt --port 1883 --service=vernemq

oc new-app vernemq/vernemq -l name=vernemq2 --name=vernemq2 --env-file envs2.txt