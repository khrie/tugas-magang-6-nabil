import cv2
from matplotlib import pyplot as plt

img = cv2.imread('source/shape.png')

gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
blur  = cv2.GaussianBlur(gray, (5,5), 0)
edges = cv2.Canny(blur, 50, 150)

_, threshold = cv2.threshold(edges, 127, 255, cv2.THRESH_BINARY)

contours, _ = cv2.findContours(threshold, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

for i, contour in enumerate(contours):
    
    if i == 0:
        continue

    area = cv2.contourArea(contour)
    if area < 50:
        continue  

    approx = cv2.approxPolyDP(contour, 0.01 * cv2.arcLength(contour, False), True)

    cv2.drawContours(img, [contour], 0, (0, 0, 255), 5)

    M = cv2.moments(contour)
    if M['m00'] != 0:
        x = int(M['m10'] / M['m00'])
        y = int(M['m01'] / M['m00'])

    sides = len(approx)
    if sides == 3:
        label = 'segitiga'
    elif sides == 4:
        label = 'persegi'
    else:
        label = 'lingkaran'

    cv2.putText(img, label, (x, y), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2)
cv2.imshow('shapes', img)
cv2.waitKey(0)
cv2.destroyAllWindows()