function [nghiem, solanlap] = chiadoi(f, a, b, saiso)
    % Hàm chiadoi: Tìm nghiệm của phương trình bằng phương pháp chia đôi
    % f: Hàm số cần tìm nghiệm 
    % a, b: Giới hạn của khoảng phân ly nghiệm
    % Kiểm tra dấu của f(a), f(b), nếu lớn hơn 0 => khoảng phân ly sai
    % saiso: Sai số cho phép 
    % nghiem: Nghiệm tìm được
    % solanlap: Số lần lặp để tìm được nghiệm

    % Kiểm tra dấu của f(a) và f(b)
    % Nếu f(a) và f(b) cùng dấu, nghĩa là không có nghiệm 
    % trong khoảng [a, b]
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
            % Nếu f(a) và f(x) cùng dấu, dịch chuyển a đến x
            a = x;
        else
            % Nếu f(a) và f(x) trái dấu, dịch chuyển b đến x
            b = x;
        end

        nghiem = x;     % Gán nghiệm = x sau mỗi lần lặp
        solanlap = solanlap + 1; % Tăng số lần lặp lên 1 sau mỗi vòng lặp
    end
end