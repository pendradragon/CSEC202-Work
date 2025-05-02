# Final Project Completed for CSEC 202

Note: Not all aspects of the assignment are going to uploaded to this repository
> The complete report will <ins>not</ins> be uploaded to this repository. 

## Project Description:
Author a report that mimics the format of the Cybersecurity & Infrastructure Security Ageny (CISA) analysis report format. 
For each file, the following information should be provided: 
  - The name of the file
  - The size of the file
  - The type of the file
  - Hashes of the file
  - If available, labels that different antivirus vendors assign to the file.
  - If available/appropriate, the compiler that was used to generate the file
  - A YARA rule capable of detecting the file.
  - If applicable, a list of evasion strategies employed by the file (if/what packers are used, base64 encoding, etc.)
  - If applicable, a list of any domain names/IP addresses/URIs the file communicates with. 
  - If applicable, a list of protocols/methods used for outbound network communication.
  - A summary of what that file does


## Analysis Techniques Used:
  - "Basic" Static Analysis
    - Automated analysis using strings, hashing mechanisms, Get-PESecurity, etc.
  - "Advanced" Static Analysis
    - Inspecting the binary by hand using a tool like Ghidra
  - "Basic" dynamic analysis
    - Most sysinternals tools, Wireshark, etc.
  - "Advanced" dynamic analysis
    - Executing the sample in a debugger
   
***The final report with the combin
