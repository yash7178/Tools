import subprocess
import re

# Run Nmap and save the output to a file in "grepable" format
nmap_command = "nmap -oG nmap_output.txt target_ip_or_hostname"
subprocess.run(nmap_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

# Read the Nmap output file
with open("nmap_output.txt", "r") as file:
    nmap_output = file.readlines()

# Initialize a list to store formatted results
formatted_results = []

# Iterate through each line of the Nmap output
for line in nmap_output:
    # Use regular expressions to extract IP, port, service, and version information
    match = re.match(r'Host: (\S+)\s+\(\d+\.\d+\.\d+\.\d+\)\s+Ports: (\d+)/(\S+)\s+.*Service: (\S+)\s+Version: (.*)', line)
    if match:
        ip_address = match.group(1)
        port = match.group(2)
        service = match.group(3)
        version = match.group(5)
        formatted_results.append(f"{ip_address}, {port}, {service}, {version}")

# Print the formatted results
for result in formatted_results:
    print(result)
