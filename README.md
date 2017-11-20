## sqlDb

This the db portion of the application.

### Assumptions / Notes

I've made the assumption that this schema applies to United States clients.

I based this assumption off the fact that EaseCentral operates with respect to:

- Cal Data Privacy Regulations
- Hippa 

This assumption is reflected in regard to the address and phone number tables. If I were considering international addresses / phone numbers, changes would have to be made. For example:

- International phone numbers can be up to 15 digits
- Some areas, like Republic of Ireland, do not use zip codes. They use postal codes, which are indicators of postal districts
