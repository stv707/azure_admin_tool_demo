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

### **Deploying a Storage Account Using Bicep**

#### **1. Create the Bicep Template**
Save the following Bicep file as `storage-account.bicep`:

```bicep
param storageAccountName string = 'cognitozbicep123'
param location string = 'East Asia'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {}
}
```

---

#### **2. Deploy the Bicep Template**

Run the following command in the Azure CLI to deploy the Bicep template:

```bash
az deployment group create \
  --resource-group demo-az104-rg \
  --template-file storage-account.bicep
```

---

### **Explanation of the Bicep Template**
1. **Parameters**:
   - `storageAccountName`: Set to `cognitozbicep123`. You can modify this to ensure uniqueness if needed.
   - `location`: Specifies the `East Asia` region.
   - `resourceGroupName`: Set to `demo-az104-rg`.
2. **Resource Definition**:
   - The storage account is defined with `Standard_LRS` SKU and `StorageV2` kind.
   - Location and name parameters ensure it aligns with your demo requirements.

---