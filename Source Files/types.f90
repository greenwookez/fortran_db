MODULE types
    type date
        character *2 day
        character *2 month
        character *4 year
    end type date

    type data_structure
        integer id
        character *60 name
        type (date) request_date
        character *150 reason
        character *150 diagnosis
    end type data_structure
END MODULE types