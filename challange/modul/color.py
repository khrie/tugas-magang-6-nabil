import cv2
import time
import numpy as np

cap = cv2.VideoCapture(0)
if not cap.isOpened():
    print("Error: Tidak dapat membuka kamera.")
    exit()

prev_time = time.time()
font = cv2.FONT_HERSHEY_SIMPLEX

while True:
    ret, frame = cap.read()
    if not ret:
        break

    frame = cv2.flip(frame, 1)
    frame = cv2.resize(frame, (640, 480))

    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    lower_red1 = np.array([0, 120, 70])
    upper_red1 = np.array([10, 255, 255])
    lower_red2 = np.array([170, 120, 70])
    upper_red2 = np.array([180, 255, 255])

    lower_white = np.array([0, 0, 140])
    upper_white = np.array([180, 150, 255])

    mask1 = cv2.inRange(hsv, lower_red1, upper_red1)
    mask2 = cv2.inRange(hsv, lower_red2, upper_red2)
    mask3 = cv2.inRange(hsv, lower_white, upper_white)
    mask = cv2.bitwise_or(mask1, mask2)
    mask = cv2.bitwise_or(mask, mask3)

    mask = cv2.medianBlur(mask, 5)

    contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    for contour in contours:
        area = cv2.contourArea(contour)
        if area > 1000:  
            cv2.drawContours(frame, [contour], -1, (0, 255, 0), 3)

    new_time = time.time()
    fps = int(1 / (new_time - prev_time))
    prev_time = new_time
    cv2.putText(frame, f"FPS: {fps}", (7, 70), font, 1, (100, 255, 0), 2)

    cv2.imshow("Color Detection", frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
