from pymodbus.client import ModbusTcpClient
from pymodbus.payload import BinaryPayloadDecoder
from pymodbus.constants import Endian

# --- Configuration ---
ip = '10.10.142.105'  # Replace with actual IP
port = 502
start_register = 0  # Replace with known or suspected register address
num_registers = 125 # Number of registers to read (adjust as needed)

# --- Connect to Modbus TCP device ---
client = ModbusTcpClient(ip, port=port)
client.connect()

# --- Read holding registers ---
response = client.read_holding_registers(start_register, num_registers, unit=1)

if response.isError():
    print("Error reading registers.")
else:
    # Decode as ASCII (each register is 2 bytes)
    decoder = BinaryPayloadDecoder.fromRegisters(
        response.registers,
        byteorder=Endian.BIG,
        wordorder=Endian.BIG
    )
    ascii_data = decoder.decode_string(num_registers * 2).decode('ascii', errors='ignore')
    print(f"ASCII content from registers {start_register} to {start_register + num_registers - 1}:")
    print(ascii_data)

client.close()