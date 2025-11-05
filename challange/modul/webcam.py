import cv2
import time

cap = cv2.VideoCapture(0) 

if not cap.isOpened():
    print("Error: Tidak dapat membuka kamera.")
    exit()

prev_fps = 0
new_fps = 0 

while True:
    ret, frame = cap.read()
    if not ret:
        print("Gagal membaca frame dari kamera.")
        break

    frame = cv2.resize(frame, (640, 480))

    font = cv2.FONT_HERSHEY_SIMPLEX
    new_fps = time.time()

    fps = 1/(new_fps-prev_fps)
    prev_fps = new_fps

    fps = int(fps)

    fps = str(fps)

    frame = cv2.flip(frame,1)

    cv2.putText(frame, fps, (7, 70), font, 3, (100, 255, 0), 3, cv2.LINE_AA)

    cv2.imshow("Webcam Live", frame)
    key = cv2.waitKey(1) & 0xFF

    if key == ord('q'):
        print("Dihentikan oleh pengguna.")
        break

    if key == ord('s'):
        print("screenshots taken")
        cv2.imwrite("output.jpg", frame)
        
    

cap.release()
cv2.destroyAllWindows()