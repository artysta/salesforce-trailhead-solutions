AND(
    MailingPostalCode != Account.ShippingPostalCode,
    NOT(
        ISBLANK(AccountId)
    )
)