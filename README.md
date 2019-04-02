# IRIS Health Integration Demo

This demo shows how easy it is to integrate an Electronic Medical Record system that is sending HL7 messages and AWS. The example shows how we can receive appointments (SIU_S12 messages), extract data from the message and do two things with the data:
- Send a SMS to notify the patient of the appointment
- Store the data on a table and give you a realtime Dashboard about your business

The picture bellow shows the workflow:

![Demo Landing Page](https://raw.githubusercontent.com/intersystems-community/irisdemo-demo-appointmentsms/master/README.png?raw=true)

You will find two YouTube videos bellow. The first one will spend 5min showing you the demo. But if you really and to experience building an integration with IRIS, you should watch the first and then the second.

Have fun! :)

## Just watch it

If you haven't seen [this video](https://youtu.be/04msxC1F-hs) on YouTube yet, start with it. 

## Build it yourself!

Now that you have watched the demo, you can use [this next video](https://youtu.be/lp5iNE6WUhc) and take two different paths:
- Use the video to run the demo on your PC with your AWS account. Don't worry, the video helps you to set it up and AWS has a free tier for sending SMS messages!
- Use the video to build parts of your demo yourself!

To just run the demo on your PC, make sure you have docker installed on your machine and run the following command:

```bash
docker run -it --rm -p 52773:52773 --name iris intersystemsdc/irisdemo-demo-appointmentsms:stable
```

Then open the demo landing page on http://localhost:52773/csp/user/demo.csp.

Use the username **SuperUser** and the password **SYS**. This is just a demo that is running on your machine, so we are using a default password.

If you want to experience on building parts of the demo, start this other container instead:

```bash
docker run -it --rm -p 52773:52773 --name iris intersystemsdc/irisdemo-demo-appointmentsms:student
```

This container has many componentes of the demo missing, so you will have to build and add them yourself! A lot of fun!

Independently of the path you choose, don't forget to follow [this video](https://youtu.be/lp5iNE6WUhc) for guidance.

Enjoy!
