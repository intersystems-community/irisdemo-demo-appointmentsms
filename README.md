# IRIS Health Integration Demo

This demo shows how easy it is to integrate an Electronic Medical Record system that is sending HL7 messages and AWS. The example shows how we can receive appointments (SIU_S12 messages), extract data from the message and do two things with the data:
- Send a SMS to notify the patient of the appointment
- Store the data on a table and give you a realtime Dashboard about your business

You will find two YouTube videos bellow. The first one will spend 5min showing you the demo. But if you really and to experience building an integration with IRIS, you should watch the first and then the second.

Have fun! :)

## Just watch it

To just run the demo, make sure you have docker installed on your machine and run the following command:

```bash
docker run -it --rm -p 52773:52773 --name iris intersystemsdc/irisdemo-demo-appointmentsms:stable
```

Then open the demo landing page on http://localhost:52773/csp/user/demo.csp.

Watch [this video](http://www.youtube.com/) on YouTube to see how to navigate the demo.

## Build it yourself!

If you want to experience on building parts of the demo, start this other container:

```bash
docker run -it --rm -p 52773:52773 --name iris intersystemsdc/irisdemo-demo-appointmentsms:student
```

[This video](http://www.youtube.com/) will guide you.