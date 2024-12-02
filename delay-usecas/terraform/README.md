# 🚀 Delayed Knowledge

**A Terraform configuration to sequentially create knowledge resources with timed delays between each step.**

---

## 📋 Description

This Terraform plan creates three knowledge resources sequentially using the `kubiya` provider, with controlled delays between each resource creation using the `time_sleep` resource from the `time` provider.

### Key Features:

1. **Knowledge Resource Management**:
   - Sequential creation of knowledge resources.
   - Each resource includes a name, description, content, and group assignments.

2. **Timed Execution**:
   - Delays are introduced between each resource creation to simulate staged deployment or dependent operations.

---

## 🌟 Resources

### Providers
- `kubiya` for managing knowledge resources.
- `time` for implementing delays between resource creations.

### Resources
1. **`kubiya_knowledge.first`**:
   - **Name**: `first knowledge - number 1 - immediately`
   - **Group**: `Admin`
   - **Content**: `first knowledge content - number 1 - immediately`
   - **Description**: `first knowledge description - number 1 - immediately`

2. **`time_sleep.wait_30_seconds_first`**:
   - **Purpose**: Introduces a delay before creating the second knowledge resource.
   - **Duration**: Configured using the `first_delay` variable.

3. **`kubiya_knowledge.second`**:
   - **Name**: `second knowledge - number 2 - delayed 30 seconds`
   - **Group**: `Admin`
   - **Content**: `second knowledge content - number 2 - delayed 30 seconds`
   - **Description**: `second knowledge description - number 2 - delayed 30 seconds`

4. **`time_sleep.wait_30_seconds_second`**:
   - **Purpose**: Introduces a delay before creating the third knowledge resource.
   - **Duration**: Configured using the `second_delay` variable.

5. **`kubiya_knowledge.third`**:
   - **Name**: `third knowledge - number 3 - delayed 60 seconds`
   - **Group**: `Admin`
   - **Content**: `third knowledge content - number 3 - delayed 60 seconds`
   - **Description**: `third knowledge description - number 3 - delayed 60 seconds`

---

## ⚙️ Input Variables

| Variable       | Description                                    | Default |
|----------------|------------------------------------------------|---------|
| `first_delay`  | Duration for the delay after the first resource | `30s`   |
| `second_delay` | Duration for the delay after the second resource | `30s`   |

---
