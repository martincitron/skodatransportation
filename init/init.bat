rem docker login --username martincitron
rem 2c082851-2929-401e-8324-2f24e0419f93

rem oc new-app martincitron/acebuild~git@github.com:martincitron/HW.git#dev --strategy=source -l name=dev --name=dev --source-secret=github
oc new-app martincitron/acebuild~https://github.com/martincitron/HW.git#prod --strategy=source -l name=prod --name=prod

curl --request POST -H "Content-Type: application/json" -H "Accept: application/vnd.github.v3+json" -u "martincitron:8785e702c20147763b67c433434b4d6293bcca01" -d "@init\createhook.json" https://api.github.com/repos/martincitron/HW/hooks

oc create route edge lb --port 7800 --service=prod

oc create route edge prodadmin --port 7600 --service=prod

oc new-app martincitron/acebuild~https://github.com/martincitron/HW.git#prodfeat --strategy=source -l name=prodfeat --name=prodfeat

oc create route edge prodfeatadmin --port 7600 --service=prodfeat

oc import-image acebuild

oc new-app https://github.com/martincitron/iteaclient.git --strategy=source -l name=client --name=client