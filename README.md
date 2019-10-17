# IRIS Healthcare Integration Demo

This demo shows how easy it is to integrate an Electronic Medical Record system that is sending HL7 messages with AWS. The example shows how we can receive appointments (SIU_S12 messages), extract data from the message and do two things with the data:
- Send a text (SMS) to notify the patient of the appointment
- Store the data on a table and give you a real-time dashboard about your business

The picture bellow shows the workflow:

![Demo Landing Page](https://raw.githubusercontent.com/intersystems-community/irisdemo-demo-appointmentsms/master/README.png?raw=true)

You will find two YouTube videos bellow. The first one is 10 minutes long and walks you through the IRIS demo. But if you want to experience building an integration project with IRIS, we recommend watching both videos.

Have fun! :)

## Just watch it

Start with [this video](https://youtu.be/04msxC1F-hs) demo on YouTube (if you haven't already watched it).

## Build it yourself!

Now that you have watched the demo, you can watch [this second video](https://youtu.be/lp5iNE6WUhc) and take two different paths:
- Use the video to run the demo on your PC with your AWS account. Don't worry, the video guides you through set up and AWS has a free tier for sending text messages!
- Use the video to build parts of your demo yourself.

To just run the demo on your PC, make sure you have Docker installed on your machine and run the following command:

```bash
docker run -it --rm -p 52773:52773 --name iris intersystemsdc/irisdemo-demo-appointmentsms:latest
```

Then open the demo landing page on [http://localhost:52773/csp/appint/demo.csp](http://localhost:52773/csp/appint/demo.csp).

Use the username **SuperUser** and the password **sys**. This is just a demo that is running on your machine, so we are using a default password.

If you want to experience on building parts of the demo, start this other container instead:

```bash
docker run -it --rm -p 52773:52773 --name iris intersystemsdc/irisdemo-demo-appointmentsms:latest-student
```

In this container, many componentes of the demo are missing, so you get to build and add them yourself.

Independently of the path you choose, don't forget to follow [the second video](https://youtu.be/lp5iNE6WUhc) for guidance.

Enjoy!

# Report any Issues

Please, report any issues on the [Issues section](https://github.com/intersystems-community/irisdemo-demo-appointmentsms/issues).
