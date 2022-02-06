# set up MSSQL connection to Airflow
sudo su
sudo apt-get install --reinstall build-essential -y
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

#Download appropriate package for the OS version
#Choose only ONE of the following, corresponding to your OS version

#Ubuntu 20.04
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

exit
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17
# optional: for bcp and sqlcmd
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools
# switch to ~/.zshrc if necessary
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
# optional: for unixODBC development headers
sudo apt-get install -y unixodbc-dev

# dev packages
sudo apt-get install python3-dev
pip install pymssql
pip install wheel
pip install 'apache-airflow[mssql]'
pip install pyodbc
pip install 'apache-airflow[azure]'
