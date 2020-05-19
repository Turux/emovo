function sex=setB_sex(name,database)
switch database
    case 'berlin'
        switch name(1:2)
            case {'08','09','13','14','15','16'} % femmine
                sex='F';
            case {'03','10','11','12'}
                sex='M';
        end
    case 'emovo'
        switch name(2)
            case {'f'} % femmine
                sex='F';
            case {'m'}
                sex='M';
        end
end