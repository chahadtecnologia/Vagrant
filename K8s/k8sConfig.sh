#/bin/bash
# kubeadm init configuration
echo -e "=====> Running kubeadm init configuration <====="
sudo kubeadm init --pod-network-cidr 172.17.0.0/16 --apiserver-advertise-address 192.168.0.20 >> kubeadm_init_output
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sleep 60

# Calico configuration
echo -e "=====> Running Calico configuration <====="
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.29.1/manifests/tigera-operator.yaml
curl https://raw.githubusercontent.com/projectcalico/calico/v3.29.1/manifests/custom-resources.yaml -O
sed -i 's/192.168.0.0/172.17.0.0/g' custom-resources.yaml && kubectl apply -f custom-resources.yaml