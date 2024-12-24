function result = daohamTaylor(xa, ya, x0)
    % Tính đạo hàm từ mảng dữ liệu xa, ya bằng phương pháp Taylor
    % xa: Mảng các giá trị x
    % ya: Mảng các giá trị y tương ứng
    % x0: Điểm x0 cần tính đạo hàm

    % Tìm vị trí của x0 trong mảng xa
    idx = find(xa == x0);
    if isempty(idx)
        warning('x0 không nằm trong mảng xa');
        result = NaN;
        return;
    end

    % Tìm bước nhảy h bằng cách lấy khoảng cách giữa hai giá trị gần kề
    if idx == 1
        h = xa(2) - xa(1);
    elseif idx == length(xa)
        h = xa(end) - xa(end-1);
    else
        h = min(xa(idx+1) - xa(idx), xa(idx) - xa(idx-1));
    end

    % Tính giá trị hàm tại x0 và các điểm gần kề
    if idx == 1
        f_x1 = ya(idx+1);
        f_x_1 = ya(idx); % Không có giá trị trước, dùng chính giá trị tại idx
    elseif idx == length(xa)
        f_x1 = ya(idx); % Không có giá trị sau, dùng chính giá trị tại idx
        f_x_1 = ya(idx-1);
    else
        f_x1 = ya(idx+1);
        f_x_1 = ya(idx-1);
    end

    % Tính đạo hàm gần đúng theo công thức Taylor chiều trung tâm
    result = (f_x1 - f_x_1) / (2 * h);
end
