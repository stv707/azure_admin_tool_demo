# azure_admin_tool_demo
A Repo to Demo the ways things can be created in Azure ( For AZ-104 Demo ) 

---

### **1. Azure Portal Method**
1. Log in to the Azure Portal.
2. Navigate to **Storage Accounts**.
3. Click **Create**.
4. Fill in the required details:
   - **Subscription**: Select your subscription.
   - **Resource Group**: Select or create a resource group named `demo-az104-rg`.
   - **Storage Account Name**: Provide a unique name, e.g., `cognitozportal123`.
   - **Location**: Select `East Asia`.
   - **Performance**: Standard.
   - **Redundancy**: Locally-redundant storage (LRS).
5. Click **Review + Create**, then **Create**.

---

### **2. Azure CLI Method (Azure Cloud Shell)**
Run the following command in the **Azure CLI**:

```bash
az storage account create \
  --name cognitozcli123 \
  --resource-group demo-az104-rg \
  --location eastasia \
  --sku Standard_LRS
```

**Steps**:
- Open the Azure Cloud Shell (accessible from the portal).
- Run the command. A new storage account with the name `cognitozcli123` will be created.

---

### **3. ARM Template Method**
1. **Create an ARM Template**:
   Save the following JSON template as `storage-account.json`:

   ```json
   {
     "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
     "contentVersion": "1.0.0.0",
     "resources": [
       {
         "type": "Microsoft.Storage/storageAccounts",
         "apiVersion": "2021-04-01",
         "name": "cognitozarm123",
         "location": "eastasia",
         "sku": {
           "name": "Standard_LRS"
         },
         "kind": "StorageV2",
         "properties": {}
       }
     ]
   }
   ```

2. **Deploy the Template**:
   Use the Azure CLI to deploy:

   ```bash
   az deployment group create \
     --resource-group demo-az104-rg \
     --template-file storage-account.json
   ```

**Steps**:
- Save the template.
- Run the deployment command in the Azure Cloud Shell.

---
