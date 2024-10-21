function prod_env() {
    gcloud config set project euria-production-a66b74e
    kubectx gke_euria-production-a66b74e_europe-west1_euria-production-a66b74e
}

function dev_env() {
    gcloud config set project brokering-development-e67382a
    kubectx gke_brokering-development-e67382a_europe-west1_brokering-development-e67382a
}

function enter_mysql() {
    local proxy_ip=$(gcloud compute instances list | grep proxy | awk '{print $4}')
    local proxy="${proxy_ip}:8080"
    local mysql_pod=$(HTTPS_PROXY="${proxy}" kubectl -n ops get pods | grep mysql | awk '{print $1}')
    HTTPS_PROXY="${proxy}" kubectl -n ops exec -it $mysql_pod -- /bin/bash
}

function dev_mysql() {
    dev_env
    enter_mysql
}

function prod_mysql() {
    prod_env
    enter_mysql
}

source '/opt/local/libexec/google-cloud-sdk/completion.zsh.inc'
export PATH=/opt/local/libexec/google-cloud-sdk/bin:$PATH
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

