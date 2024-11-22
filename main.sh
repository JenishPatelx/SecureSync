#! /bin/bash

# Color Definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color

# Design Header
clear
echo -e "${CYAN}*****************************************"
echo -e "${MAGENTA}*** Welcome to ${WHITE}SecureSync${MAGENTA} File Integrity Checker ***"
echo -e "${CYAN}*****************************************"
echo -e "${YELLOW}Created by: Jenish Patel${NC}"
echo -e "${CYAN}*****************************************"
echo

main() {
    echo -e "${BLUE}What would you like to do today?${NC}"
    echo -e "${YELLOW}1.${NC} Create Baseline"
    echo -e "${YELLOW}2.${NC} Run Integrity Check"
    echo -e "${YELLOW}3.${NC} Generate Report"
    echo -e "${YELLOW}q.${NC} Quit"
    echo -e "${CYAN}*****************************************"
    read opt

    while [ "$opt" != "q" ]
    do
        case $opt in
        [1]*)
            echo -e "${BLUE}Please enter a Directory to create a baseline of: ${NC}"
            read dir
            source ./baseline_creator.sh "$dir"
            ;;

        [2]*)
            echo -e "${RED}WARNING! Running a check will destroy any data stored in the temp_Reports file.${NC}"
            echo -e "${YELLOW}Do you wish to continue? (y/n) ${NC}"
            read ans
            if [ "$ans" == "y" ]; then
                echo -e "${BLUE}Please enter the Directory you want to check: ${NC}"
                read dir
                source ./run_check.sh "$dir"
            fi
            ;;

        [3]*)
            echo -e "${CYAN}Would you like to create a report from your temp_Reports file? (y/n) ${NC}"
            read ans

            if [ "$ans" == "y" ]; then
                echo -e "${GREEN}Please name your report file: ${NC}"
                read name
                source ./reporting.sh "./Reports/temp_Report.txt" > "./Reports/$name"
                echo -e "${GREEN}Report $name has been generated successfully!${NC}"
            fi
            ;;

        *)
            echo -e "${RED}Invalid option. Please choose again.${NC}"
            ;;
        esac

        # Repeat options
        echo -e "${CYAN}*****************************************"
        echo -e "${BLUE}Would you like to do anything else?${NC}"
        echo -e "${YELLOW}1.${NC} Create Baseline"
        echo -e "${YELLOW}2.${NC} Run Integrity Check"
        echo -e "${YELLOW}3.${NC} Generate Report"
        echo -e "${YELLOW}q.${NC} Quit"
        echo -e "${CYAN}*****************************************"
        read opt
    done

    # Exit message
    echo -e "${CYAN}*****************************************"
    echo -e "${MAGENTA}Thank you for using ${WHITE}SecureSync${MAGENTA} File Integrity Checker!${NC}"
    echo -e "${YELLOW}Goodbye!${NC}"
}

main
