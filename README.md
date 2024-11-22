Overview



The SecureSync is a BASH-script-based program designed to help users monitor the integrity of their file systems by detecting any changes (modifications, deletions, additions) in files and directories. It allows users to create baselines of chosen directory trees and periodically check for changes to ensure that the files remain intact and unaltered.



Features:



Create Baseline: Capture a snapshot of the current state of files (hash, size, timestamps) for a chosen directory tree.
Integrity Check: Periodically check the current file system against the baseline to detect any modifications, deletions, or additions.
Change Reporting: Generate detailed reports listing the detected changes (modified, deleted, or added files) with their respective statuses.
User-Friendly: The program is easy to use, making it accessible to users without deep technical expertise.




How It Works:



Create a Baseline: The program scans a directory tree and stores a snapshot of each file's metadata (hash, size, etc.) into a baseline file.
Integrity Check: When run again, the program compares the current state of the directory tree to the stored baseline. It identifies changes by comparing file hashes and properties.
Report Generation: If any changes are detected (file modifications, deletions, or additions), the program flags them and generates a user-friendly report.

![ALT TEXT](https://github.com/JenishPatelx/SecureSync/blob/main/image.png)

How to Run-->

Clone or Download the Repository:


git clone https://github.com/yourusername/your-repository-name.git


cd your-repository-name

Run the Program:



To create a baseline and start monitoring the file system




./main.sh

To run the program with administrative privileges (if needed):




sudo ./main.sh


