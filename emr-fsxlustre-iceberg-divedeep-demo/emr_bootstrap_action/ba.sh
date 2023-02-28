sudo amazon-linux-extras install -y lustre2.10
sudo mkdir -p /mnt/fsx
sudo mount -t lustre -o noatime fs-06c50be525987a194.fsx.us-east-1.amazonaws.com@tcp:/kpml7bev /mnt/fsx
sudo ln -s /mnt/fsx /lustre
sudo chmod -R 755 /mnt/fsx
sudo chmod -R 755 /lustre
