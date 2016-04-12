from pig_util import outputSchema
@outputSchema('currencyConverter:int')
def currencyConverter(fare):
    output_currency = ''
    output_currency = fare * 60

    return output_currency
