    % fxy: Hàm số f(x, y) trong phương trình vi phân y' = f(x, y)
    % x0: Giá trị ban đầu của x
    % xn: Giá trị kết thúc của x
    % y0: Giá trị ban đầu của y tại x = x0
    % N: Số bước phân đoạn
function [x,y] = RK(fxy,x0,xn,y0,N)
    syms x; % Khai báo biến x dạng symbolic
    syms y; % Khai báo biến y dạng symbolic
    h = (xn - x0) / N; % Tính bước nhảy h: h = (xn - x0) / N
    x = [x0, ]; % Khởi tạo mảng x với giá trị đầu tiên là x0
    y = [y0, ]; % Khởi tạo mảng y với giá trị đầu tiên là y0
    for i = 1:N
        % Tính giá trị y tại các điểm tiếp theo sử dụng phương pháp Runge-Kutta bậc 4
        k1 = h * fxy(x(i), y(i)); % Hệ số k1: Tính tại điểm ban đầu (x_i, y_i)
        k2 = h * fxy(x(i) + 0.5 * h, y(i) + 0.5 * k1); % Hệ số k2: Tính tại điểm giữa đoạn với (x_i + h/2, y_i + k1/2)
        k3 = h * fxy(x(i) + 0.5 * h, y(i) + 0.5 * k2); % Hệ số k3: Tính tại điểm giữa đoạn với (x_i + h/2, y_i + k2/2)
        k4 = h * fxy(x(i) + h, y(i) + k3); % Hệ số k4: Tính tại điểm cuối đoạn với (x_i + h, y_i + k3)  
        % Tính giá trị y(i+1) theo công thức R-K4:
        y1 = y(i) + (1/6) * (k1 + 2 * k2 + 2 * k3 + k4); 
        x = [x, x(1) + i * h]; % Cập nhật mảng x với giá trị mới: x(i+1) = x0 + i * h
        y = [y, y1];% Cập nhật mảng y với giá trị gần đúng mới: y(i+1) 
    end
end
