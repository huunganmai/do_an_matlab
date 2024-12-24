    % fxy: Hàm số f(x, y) trong phương trình vi phân y' = f(x, y)
    % x0: Giá trị ban đầu của x
    % xn: Giá trị kết thúc của x
    % y0: Giá trị ban đầu của y tại x = x0
    % N: Số bước phân đoạn
function [x,y] = hienantrungdiem(fxy,x0,xn,y0,N)
    syms x; % Khai báo biến x dạng symbolic
    syms y; % Khai báo biến y dạng symbolic
    h = (xn - x0) / N; % Tính bước nhảy h: h = (xn - x0) / N
    x = [x0, ]; % Khởi tạo mảng x với giá trị đầu tiên là x0
    y = [y0, ]; % Khởi tạo mảng y với giá trị đầu tiên là y0
    for i = 1:N
        % Tính giá trị y tại các điểm tiếp theo
        y2 = y(i) + (h/2) * fxy(x(i), y(i)); 
        % Bước trung gian đầu tiên: yci1 = y(i) + (h/2) * f(x(i), y(i))
        % Đây là giá trị dự đoán trung gian tại điểm giữa đoạn
        y1 = y(i) + h * fxy(x(i) + (h/2), y2); 
        % Bước hoàn chỉnh: y(i+1) = y(i) + h * f(x(i) + h/2, yci1)
        % Sử dụng giá trị trung gian yci1 để tính giá trị chính xác hơn
        x = [x, x(1) + i * h];  % Cập nhật mảng x với giá trị mới: x(i+1) = x0 + i * h
        y = [y, y1]; % Cập nhật mảng y với giá trị gần đúng mới: y(i+1)      
    end
end
