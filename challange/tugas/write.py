import cv2
import mediapipe as mp
import numpy as np
import time

class handDetector():
    def __init__(self, mode=False, maxHands=1, detectionCon=0.7, trackCon=0.7):
        self.mode = mode
        self.maxHands = maxHands
        self.detectionCon = detectionCon
        self.trackCon = trackCon

        self.mpHands = mp.solutions.hands
        self.hands = self.mpHands.Hands(
            static_image_mode=self.mode,
            max_num_hands=self.maxHands,
            min_detection_confidence=self.detectionCon,
            min_tracking_confidence=self.trackCon
        )
        self.mpDraw = mp.solutions.drawing_utils

    def findHands(self, img, draw=True):
        imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        self.results = self.hands.process(imgRGB)
        if self.results.multi_hand_landmarks:
            for handLms in self.results.multi_hand_landmarks:
                if draw:
                    self.mpDraw.draw_landmarks(img, handLms, self.mpHands.HAND_CONNECTIONS)
        return img

    def findPosition(self, img, handNo=0, draw=True):
        lmlist = []
        if self.results.multi_hand_landmarks:
            myHand = self.results.multi_hand_landmarks[handNo]
            for id, lm in enumerate(myHand.landmark):
                h, w, c = img.shape
                cx, cy = int(lm.x * w), int(lm.y * h)
                lmlist.append([id, cx, cy])
                if draw:
                    cv2.circle(img, (cx, cy), 3, (255, 0, 255), cv2.FILLED)
        return lmlist

def main():
    cap = cv2.VideoCapture(0)
    detector = handDetector()
    pTime = 0

    canvas = None
    prev_x, prev_y = 0, 0

    while True:
        success, img = cap.read()
        if not success:
            break

        img = cv2.flip(img, 1)

        if canvas is None:
            canvas = np.zeros_like(img)

        img = detector.findHands(img)
        lmlist = detector.findPosition(img, draw=False)

        if len(lmlist) != 0:
            x1, y1 = lmlist[8][1], lmlist[8][2]
            x2, y2 = lmlist[6][1], lmlist[6][2]

            if y1 < y2:  
                if prev_x == 0 and prev_y == 0:
                    prev_x, prev_y = x1, y1

                cv2.line(canvas, (prev_x, prev_y), (x1, y1), (0, 0, 255), 5)
                prev_x, prev_y = x1, y1
            else:
                prev_x, prev_y = 0, 0 

        imgGray = cv2.cvtColor(canvas, cv2.COLOR_BGR2GRAY)
        _, imgInv = cv2.threshold(imgGray, 50, 255, cv2.THRESH_BINARY_INV)
        imgInv = cv2.cvtColor(imgInv, cv2.COLOR_GRAY2BGR)
        img = cv2.bitwise_and(img, imgInv)
        img = cv2.bitwise_or(img, canvas)

        cTime = time.time()
        fps = int(1 / (cTime - pTime))
        pTime = cTime
        cv2.putText(img, str(fps), (10, 70), cv2.FONT_HERSHEY_PLAIN, 3, (255, 0, 255), 3)

        cv2.imshow("board", img)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
