# A log of refactors

## Refactor 1
copy/mimic the partitions-files cookbook of CentOS
* Attach storage file (vmdk) using SCSI instead of SATA (ubuntu vagrant image is set up this way)
* Convert to Chef Zero
* Add filesystem and lvm cookbooks (copy to file structure)
* partitions-filesystems cookbook/recipe and dependencies do not change from CentOS

## Refactor 2
Add/Copy tz cookbook

## Refactor 3
Add devops-apps cookbook

## Refactor 4
* collapse all cookbooks into one: "single-cookbook"
* Use attribute to store log file location
* append information and tests in each recipe to log file