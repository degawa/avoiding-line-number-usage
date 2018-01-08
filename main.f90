program main
    implicit none
    
    !do
    Do : block
        integer :: i
        do i=1,10
            print *,i
        end do
    end block Do
    
    !goto
    Goto : block
        real(8) :: error=1d0
        integer :: i,j,k
        Convergence : do while(error > 1d-9)
            do k=1,2
                do j=1,2
                    do i=1,2
                        error = error / dble(i)
                        print *,error
                        if(error < 1d-9) exit Convergence
                    end do
                end do
            end do
        end do Convergence
    end block Goto
    
    !format
    Format : block
        character(:),allocatable :: fmt
        real(8) :: x=10d0, y=20d0
        fmt = '(A,E10.1,A,E10.1,A)'
        print fmt, "position = (", x, ",", y, ")"
        fmt(8:8) = '2'
        print fmt, "position = (", x, ",", y, ")"
        fmt = '( "position = (", E10.1, ",", E10.1, ")" )'
        print fmt, x, y
    end block Format

    !read
    Read : block
        integer,parameter :: InputFileUnit = 37
        integer :: OpenStatus
        character(255) :: OpenMessage

        open(unit=InputFileUnit, file = "data.txt",action="read",status="old",iostat = OpenStatus,iomsg = OpenMessage)
        if(OpenStatus /= 0) then
            print '(I,A)',OpenStatus,trim(OpenMessage)
            stop
        end if

        block
            real(8),allocatable :: error(:)
            real(8) :: err
            integer :: IOStatus
            character(255) :: IOMessage
            
            error = [ real(8) :: ]
            DataRead : do
                read(InputFileUnit,*, iostat = IOStatus, iomsg = IOMessage) err
                if(IOStatus < 0) exit DataRead
                error = [ error, err ]
            end do DataRead
            print *,IOStatus,trim(IOMessage)
            print *,error(:)
        end block

        close(InputFileUnit)
    end block Read
    
end program main