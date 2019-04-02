!TODO: nameController, len150Controller,dateStringController,dateConverter, date Unconverter, databasePrinter,
PROGRAM ten
    use types
    type (data_structure) main_database(100)

    integer :: total_amount
    total_amount = 0

    call generateFile(22)
    call readFile(main_database,total_amount)

    call printDatabase(main_database,total_amount)




END

subroutine readFile(main_database,total_amount)  
    !TODO: попробовать узнать, пустой ли файл с помощью оператора из лекций
    use types
    integer :: error,total_amount,temp_count
    type (data_structure) main_database(100)
    type (data_structure) temp_input
    temp_count = 1

    open(1,FILE='../Header Files/database',FORM='unformatted') 
    do
        read(1,IOSTAT=error)temp_input
        if (is_iostat_end(error) .EQV. .TRUE.) then
            print *, 'EOF ',total_amount
            exit
        end if
        main_database(temp_count) = temp_input
        temp_count = temp_count + 1
        total_amount = total_amount+1

    end do

    close(1)
end 

subroutine generateFile(count)
    use types
    integer :: count
    type (date) temp
    type (data_structure) input
    temp%day = '19'
    temp%month = '03'
    temp%year = '2019'
    input%name = 'Huston M'
    input%request_date = temp
    input%reason = 'Heart problems, movement issues'
    input%diagnosis = 'Cold issue'
    open(1,FILE='../Header Files/database',FORM='unformatted') 
    do i=1,count
        input%id = i
        write(1)input
    end do
    close(1)
end 

logical function nameController(input)
    !returns true if there are any problems
    character *60 input
    nameController = .false.

    if (len_trim(input) .GT. 60) then
        nameController = .true.
    end if
end

logical function len150Controller(input)
    !returns true if there are any problems
    character *60 input
    len150Controller = .false.

    if (len_trim(input) .GT. 150) then
        len150Controller = .true.
    end if
end

logical function dateStringController(input)
    !returns true if there are any problems
    character *11 input
    dateStringController = .false.
end

function dateConverter(input)
    character *10 input
    dateConverter = 1
end

subroutine printDatabase(main_database,total_amount)
    use types
    type (data_structure) main_database(100)
    integer :: total_amount
    do i=1,total_amount
        write (*,'(A)') '-----------------------------------------------------------------------------------------------------&
        ------------------------------------------'
        print '(2H| ,I5,3H | ,A20,3H | ,A10,3H | ,A46,3H | ,A46,2H |)', main_database(i)%id,main_database(i)%name,'xx.xx.xxxx',&
        main_database(i)%reason,main_database(i)%diagnosis
    end do
    write (*,'(A)') '-----------------------------------------------------------------------------------------------------&
        ------------------------------------------'
end