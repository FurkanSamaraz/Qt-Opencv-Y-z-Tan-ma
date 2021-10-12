#include <QCoreApplication>
#include<opencv2/opencv.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<time.h>
#include<stdio.h>
#include<stdlib.h>
#include <tesseract/baseapi.h>
#include <leptonica/allheaders.h>
using namespace std;
using namespace cv;


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);


    // Load image
        Mat im = imread("ekran.png");
        if (im.empty())
        {
            cout << "Cannot open source image!" << endl;
            return -1;
        }

        Mat gray;
        cvtColor(im, gray, COLOR_BGR2GRAY);
        // ...other image pre-processing here...


        tesseract::TessBaseAPI api;
        api.Init("", "eng", tesseract::OEM_DEFAULT);
        api.SetPageSegMode(static_cast<tesseract::PageSegMode>(7));
        api.SetOutputName("out");

        cout<<"File name:";
        char image[256];
        cin>>image;
        PIX   *pixs = pixRead(image);


}
