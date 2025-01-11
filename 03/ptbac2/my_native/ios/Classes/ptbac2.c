#include <stdio.h>
#include <math.h>

void giaiPhuongTrinhBac2(float a, float b, float c, float* x1, float* x2, int* resultCode) {
    float delta;

    // Kiểm tra điều kiện a = 0 (không phải phương trình bậc 2)
    if (a == 0) {
        // không phải phương trình bậc 2 trả về 0
        *resultCode = 0;  
        return;
    }

    // Tính delta
    delta = b * b - 4 * a * c;

    if (delta > 0) {
        // Hai nghiệm phân biệt trả về 1
        *resultCode = 1;  
        *x1 = (-b + sqrt(delta)) / (2 * a);
        *x2 = (-b - sqrt(delta)) / (2 * a);
    } else if (delta == 0) {
        // Nghiệm kép trả về 2
        *resultCode = 2;  
        *x1 = -b / (2 * a);
        *x2 = *x1;
    } else {
        // Vô nghiệm trả về 3
        *resultCode = 3;  
    }
}
