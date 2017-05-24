#!/bin/bash

echo

echo "Pushing meeting-oosecurity..."
echo "Ensure you have successfully authenticated against docker with a 'docker login'"
sudo docker push oosecurity/meeting
