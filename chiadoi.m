function [nghiem, solanlap] = chiadoi(f, a, b, saiso)

    % Kiểm tra dấu của f(a), f(b), nếu lớn hơn 0 => khoảng phân ly sai
    if (f(a) * f(b) > 0)
        disp('Khong co khoang phan ly');
        nghiem = NaN;
        solanlap = 0;
        return;
    end

    % Khởi tạo giá trị sai số lớn hơn biến saiso để bắt đầu vòng lặp
    ea = saiso + 1; 
    solanlap = 0;   % Khởi tạo số lần lặp ban đầu.

    % Lặp cho đến khi sai số nhỏ hơn biến saiso thì dừng lại
    while ea > saiso
        x = (a+b) /2;   % Chia đôi
        ea = b-a;       % Tính sai số
        
        % Xác định khoảng phân ly nghiệm mới
        temp = f(a) * f(x);
        if (temp > 0)
            a = x;
        else
            b = x;
        end

        nghiem = x;     % Gán nghiệm = x sau mỗi lần lặp
        solanlap = solanlap + 1; % Tăng số lần lặp lên 1 sau mỗi vòng lặp
    end
end