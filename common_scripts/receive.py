import os
import sys
import socket

def receive_file(save_path, port):
    receiver_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    receiver_socket.bind(("0.0.0.0", port))
    receiver_socket.listen(1)
    print("In attesa di connessioni...")

    try:
        connection, address = receiver_socket.accept()
        print(f"Connessione accettata da {address[0]}:{address[1]}")

        with open(save_path, "wb") as file:
            while True:
                data = connection.recv(512)
                if not data:
                    break
                file.write(data)

        print("File ricevuto correttamente.")
    except Exception as e:
        print("Si e' verificato un errore durante la ricezione del file")
    finally:
        receiver_socket.close()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Utilizzo: python3 receive.py <save_path> <port>")
    else:
        save_path = sys.argv[1]
        port = int(sys.argv[2])
        receive_file(save_path, port)

