# Terraform Infra

This repository provides a modular, multi-cloud Terraform infrastructure setup supporting AWS, Azure, GCP, and Kubernetes. It is organized for scalability, reusability, and environment separation.

## Structure

```
terraform-infra/
├── providers/      # Provider-specific configs (AWS, Azure, GCP, Kubernetes, Cloudflare)
├── modules/        # Reusable modules (network, compute, database, storage)
├── envs/           # Environment-specific variable files (dev, staging, prod)
├── versions.tf     # Terraform and provider version requirements
├── backend.tf      # Remote state configuration
└── README.md
```

## Getting Started

## Installation Guide (Windows)

### 1. Install Chocolatey

Open PowerShell as Administrator and check your execution policy:

```powershell
Get-ExecutionPolicy
```

If it returns `Restricted`, run one of the following to change it:

```powershell
Set-ExecutionPolicy AllSigned
```
or
```powershell
Set-ExecutionPolicy Bypass -Scope Process
```

Then install Chocolatey:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Verify installation:

```powershell
choco -?
```

### 2. Install Terraform via Chocolatey

Once Chocolatey is installed, run:

```powershell
choco install terraform -y
```

Verify Terraform installation:

```powershell
terraform -version
```


2. **Configure Provider Credentials**  
   - AWS: Set up your AWS credentials (`~/.aws/credentials` or environment variables).
   - Azure: Authenticate via `az login` or set environment variables.
   - GCP: Set up your service account and `GOOGLE_APPLICATION_CREDENTIALS`.
   - Kubernetes: Ensure your `kubeconfig` is available.
   - Cloudflare: Set `cloudflare_email` and `cloudflare_api_key` in `terraform.tfvars`.

3. **Select Environment**  
   Choose the environment (`dev`, `staging`, `prod`) and provider (`aws`, `azure`, `gcp`, `kubernetes`, `cloudflare`).

4. **Initialize Terraform**  
   Navigate to the provider directory and initialize:
   ```sh
   cd providers/aws
   terraform init
   ```

5. **Plan and Apply**  
   Use the appropriate environment tfvars file:
   ```sh
   terraform plan -var-file=../../envs/dev/aws.tfvars
   terraform apply -var-file=../../envs/dev/aws.tfvars
   ```

   Replace `dev` and `aws` with your target environment and provider.

## How to Run

Follow these steps to deploy infrastructure using Terraform:

1. **Navigate to the provider directory**  
   Example for AWS:
   ```sh
   cd terraform-infra/providers/aws
   ```
   Example for Cloudflare:
   ```sh
   cd terraform-infra/providers/cloudflare
   ```

2. **Initialize Terraform**  
   ```sh
   terraform init
   ```

3. **Plan the deployment**  
   Use the appropriate environment tfvars file:
   ```sh
   terraform plan -var-file=../../envs/dev/aws.tfvars
   ```

4. **Apply the deployment**  
   ```sh
   terraform apply -var-file=../../envs/dev/aws.tfvars
   ```

5. **Check outputs**  
   ```sh
   terraform output
   ```

6. **Destroy resources (when needed)**  
   ```sh
   terraform destroy -var-file=../../envs/dev/aws.tfvars
   ```

Replace `dev` and `aws` with your target environment and provider as needed.

## Common Terraform Commands

| Command | Description |
|---------|-------------|
| `terraform init` | Initialize Terraform configuration and download providers |
| `terraform plan -var-file=<env tfvars>` | Show execution plan using environment variables |
| `terraform apply -var-file=<env tfvars>` | Apply changes using environment variables |
| `terraform destroy -var-file=<env tfvars>` | Destroy resources using environment variables |
| `terraform fmt` | Format Terraform code |
| `terraform validate` | Validate Terraform configuration files |
| `terraform output` | Show output values after apply |

## Modules

Reusable modules are in `modules/` and can be referenced from provider configs:
```hcl
module "network" {
  source = "../../modules/network"
  # module variables...
}
```

## Remote State

Remote state is configured in `backend.tf`. Update the backend config as needed for your cloud provider.

## Customization

- Edit variables in `providers/<provider>/variables.tf` and `terraform.tfvars`.
- Override variables per environment in `envs/<env>/<provider>.tfvars`.

## Example: Deploy AWS S3 Bucket in Dev

```sh
cd providers/aws
terraform init
terraform plan -var-file=../../envs/dev/aws.tfvars
terraform apply -var-file=../../envs/dev/aws.tfvars
```

## Example: Deploy Cloudflare Zone

```sh
cd providers/cloudflare
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Outputs

After apply, Terraform will show resource outputs defined in `outputs.tf`.

## License

MIT

