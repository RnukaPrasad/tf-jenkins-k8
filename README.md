# tf-jenkins-k8


First in Virtal machine/local need to install jenkins and terraform

Install terraform
			linux
			adding 3rd part key to our local
				wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
			repository files( repo entries for the libraries the application need)
				echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
			update(apt)
				sudo apt-get update
			install(apt - application)
				sudo apt-get install -y terraform
        
   Install jenkins
   
   and also install azure cli for create cluster using terraform
   
   az cli
			install az cli in local
			adding a key
				sudo mkdir -p /etc/apt/keyrings
				curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
				sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

			adding package
				AZ_REPO=$(lsb_release -cs)
				echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

			update
				sudo apt-get update
			install
				sudo apt-get install -y azure-cli
			
		login
			az login
			az account set --subscription "id"
		create a role/agent
			service principle - rbac
				az ad sp create-for-rbac  --role="Contributor" --scopes="/subscriptions/94e82c16-35e8-4375-99f7-01c788dd9c3c"
			
			export ARM_CLIENT_ID="<APPID_VALUE>"
			export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
			export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
			export ARM_TENANT_ID="<TENANT_VALUE>"
