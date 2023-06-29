import os
import sys
import socket
import time

def send_file(file_path, host, port):
    # Verifica se il file esiste
    if not os.path.isfile(file_path):
        print("Il file non esiste.")
        return

    # Crea un socket TCP
    sender_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    try:
        # Connetti al destinatario
        sender_socket.connect((host, port))
        print("Connesso al destinatario.")

        # Apri il file in modalit   lettura binaria
        with open(file_path, "rb") as file:
            # Leggi il file a blocchi di 512 byte e invia i pacchetti
            while True:

                time.sleep(0.15)
                data = file.read(512)
                if not data:
                    # Fine del file
                    break

                # Invia il pacchetto al destinatario
                sender_socket.send(data)

        print("Invio del file completato.")

    except ConnectionRefusedError:
        print("Connessione rifiutata.")
    except Exception as e:
        print(f"Si    verificato un errore durante l'invio del file: {str(e)}")

    # Chiudi la connessione
    print("Chiusura della connessione")
    sender_socket.close()

if __name__ == "__main__":
    # Verifica il numero di argomenti passati
    if len(sys.argv) < 4:
        print("Utilizzo: python3 sender.py <file_path> <IP destination> <port>")
    else:
	# Ottieni gli argomenti dalla riga di comando
        file_path = sys.argv[1]
        host = sys.argv[2]
        port = int(sys.argv[3])

        # Chiamata alla funzione di invio del file
        send_file(file_path, host, port)

