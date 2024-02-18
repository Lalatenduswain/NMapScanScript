# NMap Scan Script

This Bash script automates scanning of single or multiple IP addresses using NMap and generates reports in XML and CSV formats.

## Usage

### Prerequisites
- Ensure you have NMap installed on your system.
- Make sure `xmlstarlet` and `xsltproc` are installed.

### Clone the Repository

```bash
git clone https://github.com/Lalatenduswain/NMapScanScript.git
cd NMapScanScript
```

### Running the Script

1. Navigate to the directory containing the script.
2. Make the script executable if needed: `chmod +x nmap_scan.sh`
3. Execute the script: `./nmap_scan.sh`

The script will prompt you to choose between scanning a single IP address or a file containing multiple IPs. Follow the prompts accordingly.

### Examples

#### Single IP Scan

```bash
./nmap_scan.sh
```

#### Multiple IP Scan

```bash
./nmap_scan.sh
```

Follow the prompts and provide the path to the file containing multiple IP addresses.

## Features

- Scans single or multiple IP addresses.
- Generates NMap scan reports in XML and CSV formats.
- Handles root permissions using `sudo` for required commands.
- Organizes scan reports into a designated folder.

## Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

## Disclaimer

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

Feel free to modify the README as needed to provide additional context, usage instructions, or any other relevant information.

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

## Feedback and Contributions

Your feedback and contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.


## Support or Contact

Encountering issues? Don't hesitate to submit an issue on our [GitHub page](https://github.com/Lalatenduswain/NMapScanScript/issues).


## License

This project is licensed under the [MIT License](LICENSE).
