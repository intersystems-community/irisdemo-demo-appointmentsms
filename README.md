# IRIS Health Integration Demo

This demo shows how easy it is to integrate an Electronic Medical Record system that is sending HL7 messages and AWS. The example shows how we can receive appointments (SIU_S12 messages), extract data from the message and do two things with the data:
- Send a SMS to notify the patient of the appointment
- Store the data on a table and give you a realtime Dashboard about your business

The picture bellow shows the workflow:

![Demo Landing Page](https://raw.githubusercontent.com/intersystems-community/irisdemo-demo-appointmentsms/master/README.png?raw=true)

You will find two YouTube videos bellow. The first one will spend 5min showing you the demo. But if you really and to experience building an integration with IRIS, you should watch the first and then the second.

Have fun! :)

## Just watch it

Watch [this video](http://www.youtube.com/) on YouTube to see the demo.

## Build it yourself!

Now that you have watched the demo. You can do two different things:
- You can run the demo on your onw PC
- You can experience building parts of the demo yourself!

To just run the demo on your PC, make sure you have docker installed on your machine and run the following command:

```bash
docker run -it --rm -p 52773:52773 --name iris intersystemsdc/irisdemo-demo-appointmentsms:stable
```

Then open the demo landing page on http://localhost:52773/csp/user/demo.csp.

Use the username **SuperUser** and the password **SYS**. This is just a demo that is running on your machine, so we are using a default password.

If you want to experience on building parts of the demo, start this other container:

```bash
docker run -it --rm -p 52773:52773 --name iris intersystemsdc/irisdemo-demo-appointmentsms:student
```

Follow [this video](http://www.youtube.com/) for guidance on both paths.

Enjoy!
